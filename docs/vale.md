# Vale

> Vale is an open source, command-line tool that brings your editorial style guide to life. - [vale.sh](https://vale.sh/docs/vale-cli/overview/)

There is a nice vale generator located [here](https://vale.sh/generator) that can be used to build an initial `.vale.ini` file.

## Set up vale globally

1. `mkdir ~/.config/vale`
2. Create a `.vale.ini` file in the `~/.config/vale` directory

    ```bash
    StylesPath = styles

    MinAlertLevel = suggestion

    Packages = Google

    [*]
    BasedOnStyles = Vale, Google
    ```

3. Run `vale sync`
