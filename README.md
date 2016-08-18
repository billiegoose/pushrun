# pushrun
git push ==> runs commands

# THE WORLD'S EASIEST CONTINUOUS INTEGRATION/DEPLOYMENT TOOL!!!
(IT'S STILL A WORK-IN-PROGRESS)

I have several parts of a CI/CD system built. It's gonna do stuff. And be simpler. And probably free if I can swing it.

- [ ] Listen to Github webhook for pushes
- [x] Create a temporary cloud server (currently using Ubuntu on Digital Ocean)
- [x] Git clone into the server
- [ ] Git checkout the exact commit
- [x] Test suite runner (currently using [Mochawesome](http://adamgruber.github.io/mochawesome/) for test results)
- [x] Upload test results
- [ ] Use the Github API to post the test results back to the commit
- [x] Take snapshot of cloud server to create versioned image

# WHY???

Because I have so many of the pieces written already anyway for my main money-site, I might as well glue them together and polish it a bit so it can be re-used.
