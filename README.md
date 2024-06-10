# My current weather

An app that show weather information.

## SETUP

### 0 Install Flutter Framework

[See docs here.](https://docs.flutter.dev/get-started/install)


## **1. Running the project**

To run, take into account the flavors `dev`, `hml` e `prod`.  

Each flavor has a configuration file inside the folder `base_app/.env`.

## **2. Tests**

To maintain organization, each test file must be created in the same folder structure as the file being tested. Example:

```bash
# Implementation
/lib
  /domain
    /usecases
      /XYZ_test.dart

# Test
/test
  /domain
    /usecases
      /XYZ_test.dart
```

## **3. Standards and best practices**

Project configured with [Flutter Lints](https://pub.dev/packages/flutter_lints) package.

### **4. Commits**

Standardization of commit messages must be maintained. You must follow the pattern specified in [Conventional Commits.](https://www.conventionalcommits.org/pt-br/v1.0.0/)

It is mandatory to always have a type in the commit message.
*This validation is done automatically by Lefthook at commit time.*

Accepted prefixes: build, chore, ci, docs, feat, fix, perf, refactor, revert, style, test


## **5. Archtecture**

I will apply a clean architecture layer pattern here, but I will only use the necessary layers, such as usecases, I will only use them if necessary to apply some business logic.

## **6. Critique**

- As a main criticism it would increase test coverage and perform more different types of tests.

- Create a default theme to reduce boilerplate from widgets.

- Also improve the performance of the app using managing the rebuild of hooks only when necessary and leaving it in specific widgets.

- I created packages just to illustrate how I would do it in a project that needs to scale and show knowledge.

- Use Melos to get packages dependencies.