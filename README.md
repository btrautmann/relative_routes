# relative_routes

## Testing Deep Linking

**Deep link to a non-relative route**
```console
xcrun simctl openurl booted "relative:///branch_two/"
```

**Deep link to a relative route**
```console
xcrun simctl openurl booted "relative:///branch_two/relative_one"
```
