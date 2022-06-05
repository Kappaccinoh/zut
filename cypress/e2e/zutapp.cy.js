/// <reference types="cypress" />

describe('Zutapp Test', () => {
  beforeEach(() => {
    cy.app('clean')
    cy.appScenario('basic')
    cy.login('Elon')
  })

  // note all these tests will start from the home page
  it('Creating A New Room Successfully', function() {
    cy.get('#room_name').type('New Room')
    cy.get('input').contains('Create Room').click()
    cy.contains('New Room').should('be.visible')
  })
})