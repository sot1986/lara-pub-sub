<?php

namespace Sot1986\LaraPubSub\Commands;

use Illuminate\Console\Command;

class LaraPubSubCommand extends Command
{
    public $signature = 'lara-pub-sub';

    public $description = 'My command';

    public function handle(): int
    {
        $this->comment('All done');

        return self::SUCCESS;
    }
}
