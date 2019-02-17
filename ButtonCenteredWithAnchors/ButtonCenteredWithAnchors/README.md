Menu: [Home](../../README.md)

## UIButton Centered with iOS9 Anchors

![Screenshot](screenshot-small.png)

### Overview


### Important Functions

```swift
private let button = UIButton()

private func addButton() {

    button.translatesAutoresizingMaskIntoConstraints = false
    button.titleLabel?.font = UIFont.systemFont(ofSize: 36)

    button.setTitle("Am I centered?", for: .normal)
    button.setTitleColor(.black, for: .normal)
    button.addTarget(self, action: #selector(pressed(_:)), for: .touchUpInside)

    view.addSubview(button)

    NSLayoutConstraint.activate([
        button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        button.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0)
    ])

}
```

### Additional Functions
```swift
//
```


