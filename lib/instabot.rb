require 'credentials'
require 'watir-webdriver'
require 'selenium-webdriver'


username = "XXXXXX" #Le user_name de ton compte insta
password = "XXXXXXX"   #Ton mdp     
user = "justinbieber"   #Le ou les user_name(s) des comptes que tu souhaites scraper

# Permet d'ouvrir le navigateur (Firefox ici) et d'accéder à la page de connexion.
browser = Watir::Browser.new :firefox
browser.goto "instagram.com/accounts/login/"

# Permet d'accéder aux champs User_Name et Password, et d'insérer les informations.
puts "Logging in..."
browser.text_field(:name => "username").set "#{username}"  #name => "username"  dépend du HTML du site. Si tu inspectes l'élément, tu verras dans l'HTML d'instagram name="username"
browser.text_field(:name => "password").set "#{password}"   #idem

#Permet de cliquer sur le Login Button
browser.button(:class => "_0mzm- sqdOP  L3NKy       ").click #class => "_0mzm- sqdOP  L3NKy" est le nom de la classe et .button, le type de classe. Tu trouveras ces infos en inspectant l'HTML du site.
sleep(2) #permet de laisser un temps d'attente. Pour simuler une activité humaine, je te conseille de rajouter un .rand à ton sleep. 

#Permet de naviguer sur la page de l'utilisateur que tu souhaites scraper 
browser.goto "instagram.com/#{user}/"

#Permet de dire à l'ordi, si tu n'as pas déjà Follow l'utilisateur, follow le 
if browser.button(:class => "_5f5mN       jIbKX  _6VtSN     yZn4P   ").exists?
    puts "Following #{user}"
    browser.button(:class => "_5f5mN       jIbKX  _6VtSN     yZn4P   ").click
end

#Sinon unfollow 
sleep(3)
if browser.button(:class => "_5f5mN    -fzfL     _6VtSN     yZn4P   ").exists?
    puts "Unfollowing #{user}"
    browser.button(:class => "_5f5mN    -fzfL     _6VtSN     yZn4P   ").click
    sleep(2)
    browser.button(:class => "aOOlW -Cab_   ").click
end

