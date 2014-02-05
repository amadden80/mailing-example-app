#You want to send email from your Rails app?
http://mailing-example-app.herokuapp.com/

###Mailers Using Action Mailer with SMPT:
- config your environment to know your smpt settings
- create a mailer `rails g mailer example_mailer example_message`
- edit your views for the mailer
- send:
	- `ExampleMailer.example_message().deliver`

---

###Some more details:

#development.rb

```ruby

#If you want to see delivery errors
config.action_mailer.raise_delivery_errors = **true**

#What email protical will you use?
config.action_mailer.delivery_method = :smtp

```


---

##MailGun on Heroku

###Terminal
```bash

heroku addons:add mailgun

```

###development.rb
```ruby

config.action_mailer.smtp_settings = {
	:authentication => :plain,
	:address => "smtp.mailgun.org",
	:port => 587,
	:domain => "message-example-app.herokuapp.com",
	:user_name => ENV['MAILGUN_USERNAME'],
 	:password => ENV['MAILGUN_PASSWORD']
}

```


---

##Gmail
```ruby

config.action_mailer.smtp_settings = {
	:authentication => :plain,
	:address => "smtp.gmail.org",
	:port => 587,
	:domain => "message-example-app.herokuapp.com",
	:user_name => ENV['GMAIL_USERNAME'],
 	:password => ENV['GMAIL_PASSWORD']
}

```


---

##Mailgun or Gmail... you need a mailer
```bash

rails g mailer UserMailer greetings

```

##Edit Your Mailer!

###app/mailers/user_mailer.rb

```ruby

class UserMailer < ActionMailer::Base

  default from: 'andrew@generalassemb.ly'
 
  def welcome_user(user)
    @user = user
    @url  = 'http://mailing_app.herokuapp.com'
    mail(to: @user.email, subject: 'Welcome to Mailing App Demo!!!!')
  end

end

```




---


###You can email TEXT file or an HTML file

###app/views/user_mailer/welcome_user.text.erb

```text

You are Awesome <%= @user.email %>

```

###app/views/user_mailer/welcome_user.html.erb

```html

<h1><%= @user.email %></h1>
<h2>You are so cool!</h2>


```


