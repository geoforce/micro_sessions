Feature: Micro Sessions
  
  Background:
    Given I have a rails application
    And I save the following as "config/routes.rb" in the rails application:
    """
    RailsApp::Application.routes.draw do
      match ':controller(/:action(/:id(.:format)))'
    end
    """
    And I save the following as "app/controllers/models_controller.rb" in the rails application:
    """
    class ModelsController < ApplicationController
      micro_sessions
      
      def index
        micro_session[:string] = "String"
      end
      
      def new
      end
    end
    """
    And I save the following as "app/views/models/index.html.erb" in the rails application:
    """
    <%= link_to "New", :action => :new, :micro_sessions => true %>
    <%= micro_session.id %>
    <%= micro_session[:string] %>
    """
    And I save the following as "app/views/models/new.html.erb" in the rails application:
    """
    <%= micro_session.id %>
    <%= micro_session[:string] %>
    """
  
  Scenario: Transitioning Between Pages Without Passing Micro Session ID
    Given the rails application is running
    When I go to the models page
    Then I should see "String"
    When I go to the models new page
    Then I should not see "String"
  
  Scenario: Transitioning Between Pages While Passing Micro Session ID
    Given the rails application is running
    When I go to the models page
    And I follow "New"
    Then I should see "String"

