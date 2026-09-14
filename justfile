# Build every main.typ (except those under out/), skipping outputs that are
# already up to date. Dependency tracking is done by hand here since `just`
# has no built-in file-mtime dependency graph like make does.
all:
    #!/usr/bin/env python3
    import os
    import pathlib
    import subprocess

    root_name = pathlib.Path.cwd().name

    def find_sources():
        sources = []
        for dirpath, dirnames, filenames in os.walk("."):
            if pathlib.Path(dirpath) == pathlib.Path(".") and "out" in dirnames:
                dirnames.remove("out")
            if "main.typ" in filenames:
                sources.append(pathlib.Path(dirpath, "main.typ"))
        return sources

    def output_path(src):
        d = src.parent
        if d == pathlib.Path("."):
            return pathlib.Path("out", f"{root_name}.pdf")
        parent = d.parent
        outdir = pathlib.Path("out") if parent == pathlib.Path(".") else pathlib.Path("out", parent)
        return outdir / f"{d.name}.pdf"

    def deps_of(src):
        d = src.parent
        files = []
        for dirpath, dirnames, filenames in os.walk(d):
            dp = pathlib.Path(dirpath)
            if dp == d and "out" in dirnames:
                dirnames.remove("out")
            files.extend(dp / f for f in filenames)
        return files

    def needs_rebuild(out, deps):
        if not out.exists():
            return True
        out_mtime = out.stat().st_mtime
        return any(dep.stat().st_mtime > out_mtime for dep in deps)

    for src in find_sources():
        out = output_path(src)
        deps = deps_of(src)
        if needs_rebuild(out, deps):
            out.parent.mkdir(parents=True, exist_ok=True)
            print(f"typst c {src} {out}")
            subprocess.run(["typst", "c", str(src), str(out)], check=True)

# Generate a browsable index.html for every directory under out/, with
# links to subfolders and an "Up" link back to the parent.
index:
    #!/usr/bin/env python3
    import pathlib

    OUT = pathlib.Path("out")

    def render(dir: pathlib.Path) -> str:
        rel = dir.relative_to(OUT)
        title = "Notes" if rel == pathlib.Path(".") else f"Notes / {'/'.join(rel.parts)}"

        subdirs = sorted(p for p in dir.iterdir() if p.is_dir())
        pdfs = sorted(p for p in dir.iterdir() if p.is_file() and p.suffix == ".pdf")

        lines = [
            "<!doctype html>",
            "<html>",
            "<head>",
            '  <meta charset="utf-8">',
            f"  <title>{title}</title>",
            "  <style>",
            "    body {",
            "      max-width: 900px;",
            "      margin: 2rem auto;",
            "      padding: 0 1rem;",
            "      font-family: system-ui, sans-serif;",
            "      line-height: 1.5;",
            "    }",
            "    h1 { margin-bottom: 1rem; font-size: 1.4rem; }",
            "    ul { list-style: none; padding-left: 0; }",
            "    li { margin: 0.25rem 0; }",
            "    a { text-decoration: none; }",
            "    a:hover { text-decoration: underline; }",
            '    .folder::before { content: "📁 "; }',
            '    .file::before { content: "📄 "; }',
            '    .up { color: #666; margin-bottom: 1rem; display: inline-block; }',
            "  </style>",
            "</head>",
            "<body>",
            f"  <h1>{title}</h1>",
        ]

        if rel != pathlib.Path("."):
            lines.append('  <a class="up" href="../index.html">&larr; Up</a>')

        lines.append("  <ul>")
        for sub in subdirs:
            lines.append(f'    <li><a class="folder" href="{sub.name}/index.html">{sub.name}/</a></li>')
        for pdf in pdfs:
            lines.append(f'    <li><a class="file" href="{pdf.name}">{pdf.name}</a></li>')
        lines.append("  </ul>")
        lines.append("</body>")
        lines.append("</html>")
        return "\n".join(lines) + "\n"

    dirs = [OUT] + [p for p in OUT.rglob("*") if p.is_dir()]
    for d in dirs:
        (d / "index.html").write_text(render(d))
    print(f"generated {len(dirs)} index.html file(s)")

# Build PDFs and generate the browsable index
site: all index

# Scaffold a new note: just init <note-name>
init name:
    #!/usr/bin/env python3
    import pathlib
    import sys

    name = "{{name}}"
    p = pathlib.Path(name)
    if p.exists():
        print(f"error: '{name}' already exists", file=sys.stderr)
        sys.exit(1)

    (p / ".helix").mkdir(parents=True)
    (p / "main.typ").touch()
    (p / ".helix" / "languages.toml").write_text(
        '[language-server.tinymist.config]\n'
        'typstExtraArgs = ["main.typ"]\n'
    )
    print(f"created note '{name}'")

# Remove all build outputs
clean:
    #!/usr/bin/env python3
    import shutil
    shutil.rmtree("out", ignore_errors=True)
