# GHTK API Caller
**GHTK Documentation:** https://docs.giaohangtietkiem.vn

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'ghtk'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install ghtk

## Setup for Rails
Add `config/initializers/ghtk.rb` file
```ruby
  Ghtk.setup do |config|
    config.domain = '' # Add domain for sandbox or production
    config.access_token = '' # Add your token of sandbox or production
    config.version = 1.5
  end
```

## Usage
#### How to create Order
```ruby
  serializer = ShippingServices::GhtkSerializer.new(Shipment.last)
  Ghtk::Order.create(serializer)
```
- Response data: [detail](https://docs.giaohangtietkiem.vn/?http#ng-n-h-ng)

#### How to get Order detail for check status,.....
```ruby
  Ghtk::Order.get_detail(tracking_code)
```
- Response data: [detail](https://docs.giaohangtietkiem.vn/?http#tr-ng-th-i-n-h-ng)

#### How to cancel Order
```ruby
  Ghtk::Order.cancel(tracking_code)
```
- Response data: [detail](https://docs.giaohangtietkiem.vn/?http#h-y-n-h-ng)

#### How to check shipping fee
```ruby
  serializer = ShippingServices::GhtkFeeSerializer.new(Shipment.last)
  Ghtk::ShippingFee.check(serializer)
```
- Response data: [detail](https://docs.giaohangtietkiem.vn/?http#t-nh-ph-v-n-chuy-n)
