use strict;
use warnings;
use Test::More;
use Crypto::Exchange::Binance::Spot::API;

package Binance {
    use Moo;
    extends 'Crypto::Exchange::Binance::Spot::API';
    sub send {}
    sub json_response {[
        {
            'clientOrderId'       => 'x-NS8RHAMK_gl_22505588_32',
            'cummulativeQuoteQty' => 0.00000000,
            'executedQty'         => 0.00000000,
            'icebergQty'          => 0.00000000,
            'isWorking'           => 1,
            'orderId'             => 35188945,
            'orderListId'         => '-1',
            'origQty'             => 13.80000000,
            'origQuoteOrderQty'   => 0.00000000,
            'price'               => 1.27316000,
            'side'                => 'BUY',
            'status'              => 'NEW',
            'stopPrice'           => 0.00000000,
            'symbol'              => 'XRPGBP',
            'time'                => 1618538883755,
            'timeInForce'         => 'GTC',
            'type'                => 'LIMIT',
            'updateTime'          => 1618538883755
        },{
            'clientOrderId'       => 'x-NS8RHAMK_gl_22505590_29',
            'cummulativeQuoteQty' => 0.00000000,
            'executedQty'         => 0.00000000,
            'icebergQty'          => 0.00000000,
            'isWorking'           => 1,
            'orderId'             => 35192621,
            'orderListId'         => '-1',
            'origQty'             => 13.80000000,
            'origQuoteOrderQty'   => 0.00000000,
            'price'               => 1.28371000,
            'side'                => 'SELL',
            'status'              => 'NEW',
            'stopPrice'           => 0.00000000,
            'symbol'              => 'XRPGBP',
            'time'                => 1618539295363,
            'timeInForce'         => 'GTC',
            'type'                => 'LIMIT',
            'updateTime'          => 1618539295363
        },
    ]}
}

my $binance = Binance->new;

my %pair = (coin => 'XRP', base => 'GBP');

my $data = $binance->list_open_orders(pair => \%pair);

is_deeply $data, [
    {
        'order_id'            => 35192621,
        'external_id'         => 'x-NS8RHAMK_gl_22505590_29',
        'cummulativeQuoteQty' => '0',
        'icebergQty'          => '0',
        'isWorking'           => 1,
        'type'                => 'LIMIT',
        'updateTime'          => '1618539295363',
        'filled_time'         => '2021-04-16T02:14:55',
        'buy_or_sell'         => 'SELL',
        'timestamp'           => '2021-04-16T02:14:55',
        'status'              => 'NEW',
        'origQuoteOrderQty'   => '0',
        'pair'                => {
            'base' => 'GBP',
            'coin' => 'XRP'
        },
        'order_qty'   => '13.8',
        'timeInForce' => 'GTC',
        'filled_qty'  => '0',
        'orderListId' => '-1',
        'price'       => '1.28371',
        'stopPrice'   => '0'
    },
    {
        'filled_time'         => '2021-04-16T02:08:03',
        'updateTime'          => '1618538883755',
        'type'                => 'LIMIT',
        'isWorking'           => 1,
        'icebergQty'          => '0',
        'cummulativeQuoteQty' => '0',
        'external_id'         => 'x-NS8RHAMK_gl_22505588_32',
        'order_id'            => 35188945,
        'stopPrice'           => '0',
        'price'               => '1.27316',
        'orderListId'         => '-1',
        'filled_qty'          => '0',
        'timeInForce'         => 'GTC',
        'pair'                => {
            'base' => 'GBP',
            'coin' => 'XRP'
        },
        'order_qty'         => '13.8',
        'origQuoteOrderQty' => '0',
        'timestamp'         => '2021-04-16T02:08:03',
        'status'            => 'NEW',
        'buy_or_sell'       => 'BUY'
    }
];

done_testing;