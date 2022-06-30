import create_srg_export


def get_heading(row: dict) -> str:
    if row['STIGID'] != '':
        return row['STIGID']
    else:
        return row['SRGID']


def get_content(header: str, row: dict) -> str:
    if row[header] is None:
        output.append('')
    else:
        output.append(row[header])


def write_md_file(output, output_path):
    with open(output_path, 'w') as f:
        output_lines = '\n'.join(output)
        f.write(output_lines)


def handle_dict(data: list, output_path: str, title: str) -> None:
    """
    Given a dict with the fields for the srg export, create a formatted Markdown file

    To convert to a DOCX
    sudo dnf install pandoc texlive
    pip3 install git+https://github.com/pandocker/pandoc-docx-pagebreak-py
    pandoc -f markdown -t docx -o docx.docx --filter=pandoc-docx-pagebreakpy output.md

    """
    output = []
    for row in data:
        heading = get_heading(row)
        output.append(f'# {heading}')
        output.append('')
        for _, header in create_srg_export.COLUMN_MAPPINGS.items():
            output.append(f'## {header}')
            get_content(header, output, row)
            output.append('')
        output.append('')
        output.append('\\newpage')
        output.append('')

    write_md_file(output, output_path)
