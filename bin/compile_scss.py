import argparse
from pathlib import Path
import sass


def main():
    """Compile SASS files to CSS."""
    options = parse_args()

    src_dir = Path(options.theme, "scss")
    dst_dir = Path(options.dst, "static/css")
    sass.compile(dirname=(src_dir, dst_dir))


def parse_args():
    """Parse command-line arguments."""
    parser = argparse.ArgumentParser()
    parser.add_argument("--dst", type=str, default="docs", help="root output directory")
    parser.add_argument("--theme", type=str, default="theme", help="theme directory")
    parser.add_argument("--verbose", action="store_true", help="report progress")
    return parser.parse_args()


if __name__ == '__main__':
    main()
