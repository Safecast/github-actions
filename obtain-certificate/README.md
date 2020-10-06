# obtain-certificate

## Usage

Something like this:

```
      - name: Configure AWS Credentials
        uses: aws-actions/configure-aws-credentials@v1
        with:
          aws-access-key-id: ${{ secrets.AWS_ACCESS_KEY_ID }}
          aws-secret-access-key: ${{ secrets.AWS_SECRET_ACCESS_KEY }}
          aws-region: us-west-2
      - name: Obtain certicicate
        uses: Safecast/github-actions/obtain-certificate@v1
        with:
            s3_uri: s3://safecastops-us-west-2/lego-dev
            accept_tos: true
            email: mat@safecast.org
```

## Development

Copy `env.list.example` to `env.list` and update variables accordingly.

Run `./test.sh`
