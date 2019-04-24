require "prawn"

class Invoice
  include Prawn::View

  def initialize(job)
    @job = job
    title
    producer_info
    consumer_info
  end

  def title
    text "Invoice for Job #{@job[:id]}", align: :center, size: 24
    move_down 20
  end

  def producer_info
    text "#{@job[:provider][:first_name]} #{@job[:provider][:last_name]}"
    move_down 10
    text "Lawn Ninja"
    text "405 N Madison Ave"
    text "Pasadena, CA 91101"
    move_down 20
  end

  def consumer_info
    text "Billed To:"
    text "#{@job[:consumer][:first_name]} #{@job[:consumer][:last_name]}"
    text "#{@job[:consumer][:address]}"
    text "#{@job[:consumer][:city]}, #{@job[:consumer][:state]} #{@job[:consumer][:zip_code]}"
  end
end

consumer = {id: 9843, email: "graig@bartoletti.info", password_digest: "$2a$10$vTW9VZvflmWNcn9q50drQOluQ7dZ1zS5eckRNRuFycR...", created_at: "2019-02-01 01:13:26", updated_at: "2019-02-01 01:13:26", address: "4539 Kovacek Lock", city: "East Gary", state: "NY", zip_code: "29644-1341", phone_number: "651.801.0255", first_name: "Dedra", last_name: "Stroman"}

provider = {id: 2136, first_name: "Elmo", last_name: "Kilback", email: "hobertmitchell@harris.biz", password_digest: "$2a$10$.7aO.YHPwlUqIMN7bnQy0OhKwji/9T/.fckrgX9kxZg...", phone_number: "262-803-6057", address: "4273 Huong Lodge", city: "Leatown", state: "NV", zip_code: "86874", created_at: "2019-02-01 01:07:57", updated_at: "2019-02-01 01:07:57"}


job = {id: 3295, provider_id: 2136, start_time: "2019-02-17 08:53:49", end_time: "2019-02-17 09:42:22", status: "completed", created_at: "2019-02-01 01:16:45", updated_at: "2019-02-01 01:16:45", requested_time: "2019-02-17 08:01:21", consumer_id: 9843, provider: provider, consumer: consumer}

invoice = Invoice.new(job)
invoice.save_as("invoice.pdf")