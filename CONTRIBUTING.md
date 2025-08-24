# Contributing to QVeritas

We welcome contributions to QVeritas! This document provides guidelines for contributing to our Quantum-Deterministic Proof Platform.

## Table of Contents

- [Code of Conduct](#code-of-conduct)
- [Getting Started](#getting-started)
- [How to Contribute](#how-to-contribute)
- [Development Setup](#development-setup)
- [Submission Guidelines](#submission-guidelines)
- [Coding Standards](#coding-standards)
- [Testing Requirements](#testing-requirements)
- [Documentation](#documentation)
- [Review Process](#review-process)

## Code of Conduct

By participating in this project, you agree to abide by our [Code of Conduct](CODE_OF_CONDUCT.md). Please read it before contributing.

## Getting Started

1. Fork the repository
2. Clone your fork: `git clone https://github.com/your-username/QVeritas.git`
3. Create a new branch: `git checkout -b feature/your-feature-name`
4. Set up your development environment (see [Development Setup](#development-setup))

## How to Contribute

### Reporting Issues

- Use the issue tracker to report bugs
- Check if the issue already exists before creating a new one
- Provide clear, detailed descriptions with steps to reproduce
- Include system information and relevant logs

### Suggesting Features

- Open an issue with the "enhancement" label
- Clearly describe the feature and its benefits
- Provide use cases and examples
- Discuss the implementation approach

### Contributing Code

1. **Security-Critical Components**: All cryptographic implementations must undergo rigorous peer review
2. **Formal Proofs**: Include mathematical proofs for algorithmic claims
3. **Benchmarks**: Provide performance benchmarks for new algorithms
4. **Tests**: Ensure comprehensive test coverage (minimum 95%)
5. **Documentation**: Update relevant documentation

## Development Setup

### Prerequisites

- Python 3.9+
- Rust 1.70+
- CMake 3.20+
- OpenSSL development libraries
- Git

### Environment Setup

```bash
# Clone the repository
git clone https://github.com/vabhavx/QVeritas.git
cd QVeritas

# Create virtual environment
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate

# Install dependencies
pip install -r requirements-dev.txt

# Install pre-commit hooks
pre-commit install

# Run initial tests
python -m pytest
```

## Submission Guidelines

### Pull Request Process

1. **Branch Naming**: Use descriptive branch names
   - `feature/quantum-signature-implementation`
   - `fix/memory-leak-in-verification`
   - `docs/update-api-documentation`

2. **Commit Messages**: Follow conventional commit format
   ```
   type(scope): description
   
   [optional body]
   
   [optional footer]
   ```
   
   Types: `feat`, `fix`, `docs`, `style`, `refactor`, `test`, `chore`

3. **Pull Request Template**:
   - Clear title and description
   - Link to related issues
   - List of changes
   - Testing performed
   - Breaking changes (if any)
   - Security implications

### Security Considerations

- **Cryptographic Changes**: Require approval from at least 2 cryptography experts
- **Security Reviews**: All PRs undergo automated security scanning
- **Vulnerability Disclosure**: Follow responsible disclosure practices
- **Formal Verification**: Include formal proofs for security-critical code

## Coding Standards

### Python Code

- Follow PEP 8 style guidelines
- Use type hints for all functions
- Maximum line length: 88 characters (Black formatter)
- Use docstrings for all public APIs
- Follow Google-style docstring format

### Rust Code

- Follow official Rust style guidelines
- Use `cargo fmt` for formatting
- Use `cargo clippy` for linting
- Document all public APIs with doc comments

### Documentation

- Use clear, concise language
- Include code examples
- Update API documentation for any changes
- Maintain mathematical notation consistency

## Testing Requirements

### Test Categories

1. **Unit Tests**: Test individual components
2. **Integration Tests**: Test component interactions
3. **Performance Tests**: Benchmark critical operations
4. **Security Tests**: Test against known attacks
5. **Formal Verification**: Mathematical proofs of correctness

### Testing Guidelines

- Minimum 95% code coverage
- Include edge cases and error conditions
- Test with various input sizes and types
- Performance regression tests
- Cross-platform compatibility tests

### Running Tests

```bash
# Run all tests
python -m pytest

# Run with coverage
python -m pytest --cov=qveritas --cov-report=html

# Run performance benchmarks
python -m pytest benchmarks/

# Run security tests
python -m pytest security_tests/
```

## Documentation

### Types of Documentation

1. **API Documentation**: Auto-generated from docstrings
2. **User Guides**: Step-by-step tutorials
3. **Developer Documentation**: Architecture and design decisions
4. **Mathematical Specifications**: Formal algorithm descriptions

### Documentation Standards

- Use Markdown for all documentation
- Include LaTeX for mathematical notation
- Provide working code examples
- Keep documentation up-to-date with code changes

## Review Process

### Review Criteria

1. **Correctness**: Code works as intended
2. **Security**: No security vulnerabilities
3. **Performance**: Meets performance requirements
4. **Style**: Follows coding standards
5. **Tests**: Adequate test coverage
6. **Documentation**: Proper documentation updates

### Review Timeline

- Initial review: 48 hours
- Security-critical changes: 7 days minimum
- Major features: 14 days
- Emergency fixes: 24 hours

### Approval Requirements

- **Regular Changes**: 1 maintainer approval
- **Security Changes**: 2 maintainer approvals + security team review
- **Breaking Changes**: 3 maintainer approvals + community discussion

## Release Process

1. Feature freeze for release candidates
2. Comprehensive testing and security review
3. Documentation updates
4. Version tagging following semantic versioning
5. Release notes with detailed changelog

## Community Guidelines

- Be respectful and inclusive
- Provide constructive feedback
- Help newcomers get started
- Share knowledge and expertise
- Follow the Code of Conduct

## Getting Help

- **Issues**: Use GitHub Issues for bugs and feature requests
- **Discussions**: Use GitHub Discussions for questions and ideas
- **Security**: Email security@qveritas.org for security issues
- **General**: Join our community chat or forums

## Recognition

We recognize contributors through:

- CONTRIBUTORS.md file
- Release notes acknowledgments
- Annual contributor awards
- Conference speaking opportunities

## Legal

- By contributing, you agree to license your contributions under the MIT License
- Ensure you have the right to contribute any code or content
- Do not include copyrighted material without permission
- Follow export control regulations for cryptographic code

Thank you for contributing to QVeritas! Your contributions help advance the field of post-quantum cryptography and formal verification.
