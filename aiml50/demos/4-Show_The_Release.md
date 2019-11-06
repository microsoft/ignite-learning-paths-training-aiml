# Show the Release Process

## Automating the Manual Process

Talking Points:

* So with those points in mind, let’s look at the build definition:
* Rather than doing it in Jupyter Notebooks (like last demo), let’s make it just the code

Demo :

* Let’s look at the Release:
  * Show the Release Definition
  * Show the extension for Azure DevOps and that it adds a new artifact type you can set CD on
  * Show the important task – deploying to ACI (expand Deployment Options)
  * Explain that if we wanted to (and we should), we can clone that stage, and maybe deploy to AKS or a different location. We can add gates or manual approvals or gradual rollouts.
* Now we’ve deployed, let’s look at the results:
  *Try uploading the same images again and see that the results are different. A little better, but not perfect – maybe we want to do some more training before releasing this into the wild.

## Example Demo

* [Dry run starting at 24:44](https://youtu.be/UgM8_4fAni8?t=1951)
