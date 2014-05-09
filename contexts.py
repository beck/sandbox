This is a perfect usecase for a context:

```python
from contextlib import contextmanager

@contextmanager
def new_zip(path):
    """Create and close a zip file, logging any exceptions during yield."""
    zip_file = None
    log_msg = 'There was an error creating the site zip file.'

    try:
        zip_file = ZipFile(path, 'w')
    except:
        logger.exception(log_msg)
        raise

    try:
        yield zip_file
    except:
        logger.exception(log_msg)
        raise
    finally:
        zip_file.close()
```

And then we can keep the `SiteDownloader` pretty:

```python
def generate_site_zip_file(self, site):
    path = self.get_site_zip_path(site)
    with new_zip(path) as site_zip:
        # get the site serialized as a python object
        site_data = SiteTemplateSerializer(site).data
        # add site resources
        self.zip_site_resources(site_data, site_zip)
        # add the updated site json to the zip file
        self.zip_site_data(site_data, site_zip)
    return path
```
