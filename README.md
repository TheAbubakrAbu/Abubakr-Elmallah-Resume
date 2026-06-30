# Résumé — Abubakr Elmallah

My résumé, written in LaTeX and built to a clean, ATS-friendly one-page PDF.

## Build

The build script auto-detects whichever LaTeX engine you have
(`latexmk`, `pdflatex`, or `tectonic`):

```bash
./build.sh          # compile resume.tex -> resume.pdf
./build.sh clean    # remove build artifacts (.aux, .log, …)
```

No LaTeX installed? Pick one:

- **Local, lightweight:** `brew install tectonic`, then `./build.sh`
- **Zero install:** upload `resume.tex` to [Overleaf](https://overleaf.com) and it
  compiles in the browser

## Files

| Path         | What it is                                   |
| ------------ | -------------------------------------------- |
| `resume.tex` | The résumé source — **edit this**            |
| `build.sh`   | One-command build script                     |
| `resume.pdf` | Latest compiled PDF                          |
| `resumes/`   | Archive of past dated versions (`resume-YYYY-MM-DD.pdf`) |

## Editing

The résumé is built from a few small macros (each documented inline in
`resume.tex`):

- `\resumeSubheading{Role}{Dates}{Organization}{Location}` — a work/education entry
- `\resumeProjectHeading{Name $|$ tech}{Links / year}` — a project entry
- `\resumeItem{…}` — a single bullet point

The source builds with both **XeTeX/Tectonic** and **pdfLaTeX** (engine-specific
`pdfgentounicode` calls are guarded). To enable the optional summary line, search
for `Summary & Skills (disabled)` and uncomment the two lines below it.

## Credit

Based on [Jake Gutierrez's](https://github.com/jakegut/resume) open-source LaTeX
résumé template.
