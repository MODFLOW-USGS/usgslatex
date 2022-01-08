# Installation of Univers Condensed Font Library and USGS Style Files

## Installation Instructions

1. The installation instructions assume that you have already installed
    the TeX Live distribution available from
    <https://www.tug.org/texlive/> for `Linux` and `Windows` or the
    MacTeX distribution available from <https://www.tug.org/mactex/> for
    `MacOS`. A minimal TeX Live distribution, sufficient for the Univers
    Condensed font library and USGS style files, can also be installed
    for many `Linux` distros using

   ```
       sudo apt install texlive-latex-extra texlive-science
   ```

    These installation installation instructions may work for other
    TeX distributions but this has not been tested.

2. Clone the [`usgslatex`](https://github.com/MODFLOW-USGS/usgslatex)
    repository to a location of your choice on your computer. On
    `Windows`, the `usgslatex` repository should be cloned to your `C:`
    drive for the installation file to work correctly.

3. Install the Univers Condensed font library and USGS style files

    1. To install the Univers Condensed font library and USGS style
        files on `MacOS` or `Linux` open a terminal in the `usgsLaTeX`
        subdirectory in your local clone of the `usgslatex` repository
        and type
        
        ```
            sudo ./install.sh
        ```

        `sudo` is required to modified system files (for example,
        `/usr/local/texlive/2021/texmf-var/fonts/`) for a specific
        TeX Live distribution.

    3. To install the Univers Condensed font library and USGS style
        files on `Windows`, run `install.bat` in the `usgsLaTeX`
        subdirectory in your local clone of the `usgslatex` repository
        as an Adminstrator by right-clicking on the file and selecting
        "Run as administration". Similar to installing the Univers Condensed 
        font library andUSGS style files on `MacOS` and `Linux`, `install.bat` 
        is run asan Administrator so that system files can be modified.

4. If the USGS style files have been correctly installed you should see
    something like the following on the last three lines of the output
    from `install.sh` and `install.bat`.

    1.  On `MacOS` and `Linux` you should see something like

        ```              
            Evaluate if USGS style files are available
            Location of USGS LaTeX style files:  
            /Users/jdhughes/Library/texmf/tex/latex/usgs/usgsreporta.sty
        ```
        
    2.  On `Windows` you should see something like

        ```         
            Evaluate if USGS style files are available
            Location of USGS LaTeX style files:  
            c:/texlive/texmf-local/tex/latex/usgs/usgsreporta.sty
        ```

5. Test the Installation of the Univers Condensed font library
    installation can be tested using the `testunivers.tex` TeXfile in
    the `test` subdirectory. The file `testunivers.tex` is self
    contained in its definition of the Univers family, and does not use
    a separate package file. Try running `testunivers.tex` file through
    LaTeX by typing `pdflatex testunivers.tex` in a terminal open in the
    `test` subdirectory (or your preferred method of compiling
    TeX files). Inspect the `testunivers.pdf` file. Compare the content
    of the generated [pdf]{.sans-serif} file to `testuniversPROOF.pdf`.
    If these two [pdf]{.sans-serif} files appear different the Univers
    font family was not installed correctly.

    Refer to William Asquith's original font installation document
    (`README_FontLibraryInstallation.pdf`) in the `doc` subdirectory for
    more details on installing the Univers Condensed Font Library if it
    was not successfully installed by `install.sh` and `install.bat`.

6. The file `USGSLaTeXReport.tex` is a more complicated test of
    successful installation of the USGS Style files. Try running
    `USGSLaTeXReport.tex` file through LaTeX using your preferred method
    of compiling TeX files. Inspect the `USGSLaTeXReport.pdf` file.
    Compare the content of the generated [pdf]{.sans-serif} file to
    `USGSLaTeXReportPROOF.pdf`. If these two [pdf]{.sans-serif} files
    appear different then there is a problem with your installation.
    Confirm that the USGS style files (in the `$TEXROOT/tex/latex/usgs`)
    subdirectory. `$TEXROOT` can be determined on `MacOS` and `linux` by
    typing the following in a terminal:

    ```
        kpsewhich -var-value TEXMFHOME
    ```

    `$TEXROOT` can be determined on `Windows` by typing the following in
    a terminal:
 
    ```
        kpsewhich -var-value TEXMFLOCAL
    ```

## Using the USGS Style Files

A simple example for using the LaTeX USGS style files is included in
`doc/README_USGSstyFILES.pdf`. Individual style files in the package are
also listed and described in `doc/README_USGSstyFILES.pdf`.

## Updating an existing installation

On `MacOS`, an existing installation can be updated by:

1.  Moving the existing installation (for example,
    `/usr/local/texlive/2014/`) to the trash.

2.  Move all existing LaTeX software (for example, `TeXShop`) to the
    trash.

3.  Empty trash

4.  Install the new distribution

5.  Open the TeXLive Utility and

    1.  Update the TeXLive Utility and allow any infrastructure updates

    2.  Install the `graphics-def` package if it is not installed

    3.  Update all installed packages

6.  Open a terminal in `$TEXROOT/dvips/funivers/` directory and type the
    following with `sudo` privileges to allow the new version of
    LaTeX to access the Univers Condensed Font library

    1.  `texhash`

    2.  `updmap -sys –enable Map=funivers.map`

    3.  `updmap-sys`

## Acknowledgements

The USGS Style files and instructions for installing the Univers
Condensed Font library were originally developed by William H. Asquith
in the Texas Water Science Center. The USGS style files have been
subsequently modified by Michael N. Fienen (Wisconsin Water Science
Center), Christian D. Langevin (Water Resources Mission Area), and
Joseph D. Hughes (Water Resources Mission Area) to add additional
functionality and maintain consistency with SPN guidelines.
