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
