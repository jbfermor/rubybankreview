# README

In order to use this programm, please have in mind the following:

To create a new user by console you must use:
  User.create_console_user(email, password)
  Both must be text

  Being email the mail account of the user and password a security password to access

To make a transference to a user by console, the command is:
  Transference.console_create_transference(amount, receiver_email)

  Amount is the money quantity we want to transference to an user. It is a number
  Receiver_email is the email of the user that will receive the amount of money indicated previously. It is a text

