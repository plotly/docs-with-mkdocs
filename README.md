# Docs with MkDocs

An experiment.

1.  Clone this repository.

1.  Create and activate a Python virtual environment.

1.  `pip install -r requirements.txt`.

1.  `mkdocs build` to re-generate `docs` from `src`.

1.  `mkdocs serve` to serve pages on <http://localhost:8000>.

## Notes

According to [JamStack][jamstack],
[MkDocs][mkdocs] is the most popular static site generator (SSG) in Python.
It is designed for building project documentation,
and after experimenting with it, [Pelican][pelican], and [Sphinx][sphinx],
it seems the best choice for [the documentation of Plotly's graphing libraries][plotly-lib-docs]:
it is easy to install, well-documented, fast, and extensible,
and it uses [Jinja][jinja] templates,
which are also well-documented and easy to learn.

`mkdocs.yml` contains the configuration for this demo site.
The first section defines the site name,
the copyright,
and the base URL for blog posts.
The second lays out top-level navigation items;
we can use this as-is,
or remove it and put navigation in a sidebar.

The third section, `plugins`,
configures the RSS generation plugin.
The most important value is `match_path`,
which tells the plugin where to look for pages that are considered blog posts.
(A separate plugin, `mkdocs-blogging-plugin`,
generates the blog archive pages, category pages, and so on;
it is installed by `requirements.txt` but hasn't been turned on yet.)

The final section of `mkdocs.yml` defines the input directory `docs_dir`
and the output directory `site_dir`.
(Confusingly,
[MkDocs][mkdocs] uses `docs` as the *input* directory by default,
but [GitHub Pages][ghp] requires that to contain the generated pages.)
This section also tells [MkDocs][mkdocs] to look in the local directory `theme`
for the site's [Jinja][jinja] template files.
Most [MkDocs][mkdocs] themes are distributed as Python packages instead;
the most popular is [Material for MkDocs][material-mkdocs],
but we will initially recycle the CSS and templates of our existing documentation instead.

[ghp]: https://pages.github.com/
[jamstack]: https://jamstack.org/generators/
[jinja]: https://jinja.palletsprojects.com/
[material-mkdocs]: https://squidfunk.github.io/mkdocs-material/
[mkdocs]: https://www.mkdocs.org/
[pelican]: https://getpelican.com/
[plotly-lib-docs]: https://plotly.com/python/
[sphinx]: https://www.sphinx-doc.org/
