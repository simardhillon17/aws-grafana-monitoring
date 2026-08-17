# Developer Guide
This section provides guidance to developers who may want to contribute to this
project. It specifies standards to follow and expectations on how changes are
staged, approved, and communicated.

### Branching
- First, create a branch from master named the same as the Jira ticket to which time will be posted for this work effort
- When updates are ready for review, create a pull request to the main branch and submit to your manager for approval
- Your manager will schedule a review session
- Review the changes with your team and update the code to address any issues identified in the review process
- When ready, submit your pull request for final approval and merge
- After the merge is done, close the ticket and **DELETE THE BRANCH** (unless it's a permanent release branch)
- Don't forget to **DELETE THE BRANCH** as soon as the ticket is closed!! (unless it's a permanent release branch)

### Upgrade Strategy

- Project will be evaluated quarterly for documentation structure changes and tool upgrades
- Implement upgrades using the above Branching procedure, except create a permanent release branch named after the version (e.g., branch name `v0.1.4` )
- Add a line to the table at the top of the README.md file documenting who created a new version and when it was created
- Update the `VERSION` environment variable in `build.sh`
- Update all internal image references to the new version tag (See [Debugging Guide](./debuggingguide.md)!)
- Run the build pipeline
- Broadcast notification of the new release

### Updated Branching / Upgrade Strategy
Please follow the branching and update strategy described at the link below.

[Branch Stratergy]https://docs.example.com/document/d/YOUR_DOC_ID/edit
