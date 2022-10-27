class AuthenticationMailer < ApplicationMailer
    def otp(email,otp)
        @otp = otp
        mail(to: email, subject: 'Confirm your order')
    end
end
