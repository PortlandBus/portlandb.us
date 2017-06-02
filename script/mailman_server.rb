#!/usr/bin/env ruby require "rubygems"
require "mailman"
require File.expand_path(File.join(File.dirname(__FILE__), '..', 'config', 'environment'))

Mailman.config.rails_root = '.'
Mailman.config.logger = Logger.new("log/mailman.log")
Mailman.logger.error "hello"
Mailman.config.maildir = '~/Maildir'
Mailman::Application.run do

    default do

        begin
            Email.receive_mail(message)
        rescue Exception => e
            Mailman.logger.error "Exception occurred while receiving message:\n#{message}"
            Mailman.logger.error [e, *e.backtrace].join("\n")
        end

    end

end


