# How to Deploy According to the Exercise Instructions **Inheritance.sol** :

## 1. Deploy `Salesperson`
Use these constructor values:
- **idNumber** = `55555`
- **managerId** = `12345`
- **hourlyRate** = `20`

## 2. Deploy `EngineeringManager`
Use these constructor values:
- **idNumber** = `54321`
- **managerId** = `11111`
- **annualSalary** = `200000`

## 3. Deploy `InheritanceSubmission`
When deploying this contract, enter the addresses from the two previous deployments:
- Address of the deployed `Salesperson`
- Address of the deployed `EngineeringManager`

## Notes
- Always deploy the contracts in order: `Salesperson` → `EngineeringManager` → `InheritanceSubmission`.
- Copy the deployed contract addresses from **Deployed Contracts** in Remix.
- Make sure to paste the correct addresses into the `InheritanceSubmission` constructor.
