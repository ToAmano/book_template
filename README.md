# LaTeX Book Template

This repository provides a LaTeX template designed to assist authors in creating structured and professionally formatted books. The template includes predefined settings and chapter structures to streamline the writing process.

## Features

- **Structured Organization**: The template organizes content into directories such as `frontmatter`, `chap1`, `chap2`, `chap3`, and `appendixA`, facilitating easy navigation and management of different sections of your book.
- **Predefined Settings**: The `setting` directory contains configuration files that set up document parameters, including page layout, fonts, and other typographical elements, ensuring a consistent and polished appearance.
- **Reference Management**: The `references` directory is designated for bibliographic entries, allowing for efficient citation management and integration using BibTeX.
- **Build Automation**: Included files like `.latexmkrc` provide support for automated compilation using `latexmk`, simplifying the process of generating the final PDF output.

## Prerequisites

To utilize this template, ensure that you have the following installed:

- **TeX Live**: A comprehensive TeX distribution that includes all necessary LaTeX packages.
- **latexmk**: A Perl script for managing LaTeX document compilation, automating the process of running LaTeX and associated programs as needed.

## Usage

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/ToAmano/book_template.git
   ```

2. **Navigate to the Directory**:
   ```bash
   cd book_template
   ```

3. **Compile the Document**:
   Run `latexmk` to compile the `book.tex` file and generate the PDF:
   ```bash
   latexmk -f book.tex
   ```
   This command will process the LaTeX files and produce `book.pdf` as the output.

4. **Customize Your Book**:
   - Edit the content within the chapter directories (`chap1`, `chap2`, etc.) to add your material.
   - Modify the files in the `setting` directory to adjust document settings such as margins, fonts, and headers.
   - Update the `references` directory with your bibliographic data for citations.

