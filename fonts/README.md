## Instructions for adding new ttf fonts

1. Copy ttf fonts into this directory.
2. Update `TEXMF`, `FONTFOUNDRY`, `FONTNAME`, and `FONTFAMILY` in `create_fonts.sh` to the appropriate values.

  ```
  TEXMF="/Users/jdhughes/Library/texmf"
  FONTFOUNDRY="monotype"
  FONTNAME="timesnew"
  FONTFAMILY="timesnew"
  ```

  Leave the remaining settings as is. Some of the shell script has been commented out so that the fonts are not actually installed for LaTeX, because the intent is that the files will be copied into the appropriate directories in the usgsLaTeX directory.

3. Run `sudo ./create_fonts.sh`
4. This will create the following subdirectories directories in this folder
  ```
  font
  ...font
  ...tex
  ```
5. Copy the `.map` file in the `fonts\map\dvips\` directory to the `usgsLaTeX\dvips\` directory.
6. Copy the `.ttf` files in the `fonts\truetype\` directory to the `usgsLaTeX\fonts\truetype\` directory.
7. Copy the `.tfm` files in the `fonts\tfm\` directory to the `usgsLaTeX\fonts\tfm\` directory.
8. Copy the `.fd` file in the `tex\latex\` directory to the `usgsLaTeX\tex\latex\${FONTFAMILY}\` directory. You will have to create this directory.
9. Create a font `.sty` file in the `usgsLaTeX\tex\latex\${FONTFAMILY}\` directory. Use one of the existing font `.sty` file as a template.
10. If there are no `.ttf` files in `usgsLaTeX\fonts\truetype\` directory with names ending with `i.ttf` (i.e., all you have is `.ttf` files ending with `o.ttf`) you will have to modify the `.fd` file in `usgsLaTeX\tex\latex\${FONTFAMILY}\` so that all entries with `{it}` use the appropriate `o.ttf` files.
11. Modify `./install.sh` in the `usgsLaTeX\` directory to add the new `.map` file. Add a new section like the following

  ```
  echo "Installing ${FONTFAMILY} font..."
  cd $TEXLOCAL/dvips
  updmap -sys --enable Map=${FONTFAMILY}.map
  updmap-sys
  ```

  Replace `${FONTFAMILY}` with the `FONTFAMILY` string.

12. Run `sudo ./install.sh` in the `usgsLaTeX\` directory.
