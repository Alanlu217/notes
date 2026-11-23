import html
import pathlib
import sys
from urllib.parse import quote

OUT = pathlib.Path("out")

STYLE = """\
    body {
      max-width: 900px;
      margin: 2rem auto;
      padding: 0 1rem;
      font-family: system-ui, sans-serif;
      line-height: 1.5;
    }
    h1 { margin-bottom: 1rem; font-size: 1.4rem; }
    ul { list-style: none; padding-left: 0; }
    ul ul { padding-left: 1.25rem; }
    li { margin: 0.25rem 0; }
    a { text-decoration: none; }
    a:hover { text-decoration: underline; }
    summary { cursor: pointer; }
    summary::before { content: "📁 "; }
    .file::before { content: "📄 "; }
    @media (max-width: 600px) {
      body { margin: 1rem auto; font-size: 1.15rem; }
      h1 { font-size: 1.6rem; }
      li { margin: 0.9rem 0; }
    }"""


def render_dir(d):
    subdirs = sorted(p for p in d.iterdir() if p.is_dir())
    pdfs = sorted(p for p in d.iterdir() if p.is_file() and p.suffix == ".pdf")

    lines = ["<ul>"]
    for sub in subdirs:
        lines.append(f"<li><details><summary>{html.escape(sub.name)}/</summary>")
        lines.append(render_dir(sub))
        lines.append("</details></li>")
    for pdf in pdfs:
        href = quote(pdf.relative_to(OUT).as_posix())
        lines.append(
            f'<li><a class="file" href="{href}">{html.escape(pdf.name)}</a></li>'
        )
    lines.append("</ul>")
    return "\n".join(lines)


def main():
    if not OUT.is_dir():
        sys.exit("error: out/ does not exist (run make first)")
    page = "\n".join(
        [
            "<!doctype html>",
            "<html>",
            "<head>",
            '  <meta charset="utf-8">',
            '  <meta name="viewport" content="width=device-width, initial-scale=1">',
            "  <title>Notes</title>",
            "  <style>",
            STYLE,
            "  </style>",
            "</head>",
            "<body>",
            "  <h1>Notes</h1>",
            render_dir(OUT),
            "</body>",
            "</html>",
            "",
        ]
    )
    (OUT / "index.html").write_text(page)
    print("generated out/index.html")


if __name__ == "__main__":
    main()
