import { describe, it, expect } from 'vitest'

describe('HelloWorld', () => {
  it('is True', () => {
    expect('Hello world').toContain('Hello world')
  })
})
