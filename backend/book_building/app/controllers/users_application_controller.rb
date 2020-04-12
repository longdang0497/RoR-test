class UsersApplicationController < ApplicationController
  before_action :authenticate_user!
end