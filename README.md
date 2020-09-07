# Image fetcher

CLI script to download images by links provided in a text file.

### How to use

```ruby
ruby cli.rb -f <images_file_path> -d <download_path>
```

### How to build

```ruby
bundle
```

### How to test

```ruby
rspec -fd
```

### Possible improvements

- Mock http requests so that integration tests do not use network at all
- Design file validation strategies e.g. using dry-schema instead of strict validations in the constructor
- Add different file extensions support, it will require more sophisticated classes structure rather than File
