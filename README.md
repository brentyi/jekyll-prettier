# jekyll-prettier

Post-render hooks for cleaning up Jekyll outputs with `prettier`. Really basic
&mdash; this README is longer than the plugin itself.

Written as an alternative to
[jekyll-tidy](https://github.com/apsislabs/jekyll-tidy), which uses
`htmlbeautifier` under-the-hood. Key distinctions:

- `prettier` is more robust to various input HTML styles
  ([for example, multi-line self-closing blocks](https://github.com/threedaymonk/htmlbeautifier/issues/53))
- `prettier` supports more languages
- `prettier` isn't a Ruby gem, so it needs to be installed manually

---

### Installation

1. If using Bundler (recommended); in Gemfile:

```ruby
group :jekyll_plugins do
  gem "jekyll-prettier"
end
```

2. In `_config.yml`:

```
plugins:
  - jekyll-prettier
```

---

### Dependencies

Requires that [prettier](https://prettier.io/docs/en/install.html) is installed
and in the PATH.

Can be installed with npm:

```sh
npm install --global prettier
```

or with Yarn:

```sh
yarn global add prettier
```
