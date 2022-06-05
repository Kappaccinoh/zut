/// <reference types="cypress" />

describe('Zutapp Test', function() {
  it('login', function() {
    cy.visit('http://localhost:5017/signin')
    cy.get('label').should('have.text', 'Enter your username')
    cy.get('#session_username').type('Elon')
  })
})

/*
it('homepage', function() {
  cy.visit('http://localhost:5017')
  cy.get('h2').contains('Users Online')
  cy.get('div').contains('Elon (you)')
})
*/