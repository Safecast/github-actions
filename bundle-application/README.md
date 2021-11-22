# bundle-application

A helper for bundling beanstalk applications.

Example usage:

```yaml
      - name: Create application bundle
        if: env.SECRETS_AVAILABLE
        uses: Safecast/github-actions/bundle-application@v1
        with:
            app: reporting
            s3_bucket: elasticbeanstalk-us-west-2-985752656544
```

This will zip up the repo and upload it to the provided s3 bucket, registered with the named app.

It also supports private repository key handling and Dockerrun.aws.json image replacement, but those aren't recommended since the v1 multi-container platform has been deprecated.

## Testing

You can run python locally, or use docker like so:

```
docker build -t bundle-application . && docker run --rm -it --volume $(pwd)/test_entrypoint.py:/usr/src/app/test_entrypoint.py --entrypoint pytest bundle-application
```
