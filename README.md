# terraform-gluu

[![GitHub stars](https://img.shields.io/github/stars/codejamninja/terraform-gluu.svg?style=social&label=Stars)](https://github.com/codejamninja/terraform-gluu)


![](assets/terraform-gluu.png)

> initialize gluu with terraform

Please ★ this repo if you found it useful ★ ★ ★


## Features

* Automatically registers servers with a supported DNS provider
* Adds letsencrypt certificate to gluu


## Dependencies

* [AWS CLI](https://aws.amazon.com/cli)
* [Terraform](https://terraform.io)
* [GNU Make](https://www.gnu.org/software/make)


## Usage

### Configure AWS CLI

```sh
aws configure
```

### Setup Gluu Platform

```sh
cd aws
terraform init
terraform apply
```

### Debugging

The logs from the `user-data.sh` script can be found in the
`/var/log/cloud-init-output.log` file on the server.


## Support

Submit an [issue](https://github.com/codejamninja/terraform-gluu/issues/new)


## Contributing

Review the [guidelines for contributing](https://github.com/codejamninja/terraform-gluu/blob/master/CONTRIBUTING.md)


## License

[MIT License](https://github.com/codejamninja/terraform-gluu/blob/master/LICENSE)

[Jam Risser](https://codejam.ninja) © 2018


## Changelog

Review the [changelog](https://github.com/codejamninja/terraform-gluu/blob/master/CHANGELOG.md)


## Credits

* [Jam Risser](https://codejam.ninja) - Author


## Support on Liberapay

A ridiculous amount of coffee ☕ ☕ ☕ was consumed in the process of building this project.

[Add some fuel](https://liberapay.com/codejamninja/donate) if you'd like to keep me going!

[![Liberapay receiving](https://img.shields.io/liberapay/receives/codejamninja.svg?style=flat-square)](https://liberapay.com/codejamninja/donate)
[![Liberapay patrons](https://img.shields.io/liberapay/patrons/codejamninja.svg?style=flat-square)](https://liberapay.com/codejamninja/donate)
