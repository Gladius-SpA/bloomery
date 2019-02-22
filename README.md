_Bloomeries were used in the Roman empire to manufacture, among other things, [Gladius](https://gladius.cl) swords_

## General information

This gem is intended to be used internally by Gladius collaborators. It is filled with company-specific decisions that may not be appropriate for everyone.

### Services

#### What
Service objects are Plain Old Ruby Objects (PORO) that are designed to execute one single action in your domain logic. They contain business logic that coordinates multiple artefacts by implementing the user's interactions with the application.

#### Why

Services has the benefit of concentrating the core logic of the application in a separate object, instead of scattering it around controllers and models.

#### How

```
rails g bloomery:service MyService
```

## License

MIT License. Copyright 2019 [Gladius](https://gladius.cl).
