/// <reference types="cypress" />

describe('Zutapp Test', () => {
  beforeEach(() => {
    cy.app('clean')
    cy.appScenario('basic')
    cy.login('Elon')
  })

  it('Creating A New Room Successfully', () => {
    cy.get('#room_name').type('New Room')
    cy.get('input').contains('Create Room').click()
    cy.contains('New Room').should('be.visible')
  })

  it('Game Room Lifecycle - Starting, Next Player and Ending', () => {
    cy.get('a').contains('People').click()
    cy.url().should('include', 'rooms/1')

    cy.contains('Start Game').should('be.visible').click()
    cy.contains('Room in Progress').should('be.visible')
    cy.contains('Next Player').should('be.visible').click()
    cy.contains('Current Player: Trump').should('be.visible')
    cy.contains('Next Player').click()
    cy.contains('Current Player: Elon').should('be.visible')
    cy.contains('Next Player').click()
    cy.contains('Current Player: Drake').should('be.visible')

    cy.contains('End Game').should('be.visible').click()
    cy.contains('delete group').should('be.visible')
  })

  it('Deleting A Room Successfully', () => {
    cy.get(':nth-child(1) > .d-inline > [type="submit"]').click()
    cy.contains('People').should('not.be.visible')
  })
})