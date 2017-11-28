
Menu: [Home](../../README.md)

## Custom UITableView Header

![Screenshot](screenshot-small.png)

### Overview
Subclass UIView


### Important Functions

### Required TableView Delegate Functions
```swift
override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

   let header = CustomTableViewHeaderCell()

   header.backgroundColor = UIColor(red: 90/255.0, green: 200.0/255.0, blue: 250.0/255, alpha: 1.0) // Apple Videos

   header.label1.text = "Column 1"
   header.label2.text = "Column 2"
   return header
}
```


