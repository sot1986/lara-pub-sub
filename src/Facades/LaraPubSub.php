<?php

namespace Sot1986\LaraPubSub\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * @see \Sot1986\LaraPubSub\LaraPubSub
 */
class LaraPubSub extends Facade
{
    protected static function getFacadeAccessor(): string
    {
        return \Sot1986\LaraPubSub\LaraPubSub::class;
    }
}
