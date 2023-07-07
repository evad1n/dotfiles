

Remove prefix from files (remove `-n` to actually run)

```bash
find . -iname "-private--*" -exec rename -n 's/-private--//' '{}' \;
```