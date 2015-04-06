Devise.secret_key = "f6b62578f51f8da55f2845e2255b0862c54d8f0a1c6c7b44c101327237f3bbe3d7d2abfeda5a83c0ee207a0b1fa7ff9cbff67af9c2d6a72c71ec30611f7fa40f"

SpreeSocial::OAUTH_PROVIDERS << ['LinkedIn', 'linkedin', 'true']
SpreeSocial.init_provider('linkedin')
