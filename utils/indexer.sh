#!/bin/sh

start="## Contents"

end="🍇🍈🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🥝🍅🥑🍆🥔🥕🌽🌶🥒🍄🥜🌰🍞🥐🥖🥞🧀🍖🍗🥓🍔🍟🍕🌭🌮🌯🍳🍲🥗🍿🍱🍘🍙🍚🍛🍜🍝🍠🍢🍣🍤🍥🍡🍦🍧🍨🍩🍪🎂🍰🍫🍬🍭🍮🍯🍼🥛☕🍵🍶🍾🍷🍸🍹🍺🍻🥂🥃🍽🍴🥄

<i>Inspired by <https://github.com/shaniber/recipes></i>
"

getMarkdownLinks() {
  for file in $(find . -iname "*.md" -not -name "README.md" -not -iname "*template*"); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/^# //')]("$file")"
  done
}

filter() {
  echo "$1" | grep -E "$2"
}

markdownLinks="$(getMarkdownLinks)"
drinkLinks="$(filter "$markdownLinks" drink | sort)"
foodLinks="$(filter "$markdownLinks" food | sort)"

echo "$start

### Breads
$(filter "$foodLinks" "/bread")

### Breakfasts
$(filter "$foodLinks" breakfast)

### Desserts
$(filter "$foodLinks" desserts)

### Main courses
$(filter "$foodLinks" mains)

### Pasta
$(filter "$foodLinks" pasta)

### Pizza
$(filter "$foodLinks" pizza)

### Salads
$(filter "$foodLinks" salads)

### Sandwiches
$(filter "$foodLinks" sandwiches)

### Snacks
$(filter "$foodLinks" snacks)

### Soup
$(filter "$foodLinks" soup)

### Cured and pickled
$(filter "$foodLinks" cured-pickled)

### Sides and dips
$(filter "$foodLinks" sides-dips)

### Condiments, sauces and toppings
$(filter "$foodLinks" condiments-sauces-toppings)

### Cocktails
$(filter "$drinkLinks" cocktails)

### Coffee and Tea
$(filter "$drinkLinks" coffee\|tea)

### Brewing
$(filter "$drinkLinks" beers)

$end"
