<?php

namespace Sot1986\LaraPubSub;

use Spatie\LaravelPackageTools\Package;
use Spatie\LaravelPackageTools\PackageServiceProvider;
use Sot1986\LaraPubSub\Commands\LaraPubSubCommand;

class LaraPubSubServiceProvider extends PackageServiceProvider
{
    public function configurePackage(Package $package): void
    {
        /*
         * This class is a Package Service Provider
         *
         * More info: https://github.com/spatie/laravel-package-tools
         */
        $package
            ->name('lara-pub-sub')
            ->hasConfigFile()
            ->hasViews()
            ->hasMigration('create_lara_pub_sub_table')
            ->hasCommand(LaraPubSubCommand::class);
    }
}
