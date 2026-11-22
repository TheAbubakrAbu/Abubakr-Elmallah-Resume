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

| Path                  | What it is                                                 |
| --------------------- | ---------------------------------------------------------- |
| `resume.tex`          | The base résumé source (full-stack emphasis)               |
| `resume-ios.tex`      | iOS / mobile engineering variant                            |
| `resume-teaching.tex` | Teaching & tutoring variant (iOS app development focus)     |
| `build.sh`            | One-command build script                                    |
| `resume*.pdf`         | Latest compiled PDFs                                        |
| `resumes/`            | Archive of past dated versions (`resume-YYYY-MM-DD.pdf`)    |

## Variants

Each variant is the same facts reordered and reweighted for a different reader:

```bash
./build.sh            # resume.tex          -> resume.pdf
./build.sh ios        # resume-ios.tex      -> resume-ios.pdf
./build.sh teaching   # resume-teaching.tex -> resume-teaching.pdf
```

- **Base** leads with ICSSC full-stack work; skills lead with TypeScript/React.
- **iOS** leads with the App Store apps, retitles the role "Lead iOS Developer",
  and swaps the skills block for Swift and Apple frameworks.
- **Teaching** opens with a dedicated Teaching Experience section (STEM Heroes
  Academy promoted to a full entry, plus mentoring and team leadership), then
  Education, then condensed software experience.

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
