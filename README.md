# MAAlertPresenter
It will present multiple UIAlertControllers one by one.

## Installation

Copy MAAlertPresenter.h and MAAlertPresenter.m files to your project.

## Usage

1. Copy MAAlertPresenter.h and MAAlertPresenter.m files to your project, and call

```
[[MAAlertPresenter sharedPresenter]enqueueAlert:alertController];
```

instead of 

```
[self presentViewController:alertController animated:YES completion:NULL];
```
to add UIAlertController object to the presenter queue which will present all the UIAlertControllers one by one.

2. Call ```[[MAAlertPresenter sharedPresenter]dequeueAlert];``` inside each UIAlertAction Callback to dequeue the Presented UIAlertController from the queue and allow the next UIAlertController to be presented.

## Contact
[@milan_iOS](https://twitter.com/milan_iOS)

[Milan Agarwal](mailto:agarwal.milan.apps@gmail.com)

## Licence
MAAlertPresenter is MIT licensed. See the LICENCE file for more info.
