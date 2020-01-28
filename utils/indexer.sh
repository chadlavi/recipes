#!/bin/sh
start="<h1>Recipes</h1>
You know. To cook with.

- [Food](#food)
  - [Breads](#breads)
  - [Breakfasts](#breakfasts)
  - [Desserts](#desserts)
  - [Main courses](#main-courses)
  - [Pasta](#pasta)
  - [Pizza](#pizza)
  - [Salads](#salads)
  - [Sandwiches](#sandwiches)
  - [Snacks](#snacks)
  - [Soup](#soup)
  - [Cured and pickled](#cured-and-pickled)
  - [Sides and dips](#sides-and-dips)
  - [Condiments, sauces and toppings](#condiments-sauces-and-toppings)
- [Drinks](#drinks)
  - [Cocktails](#cocktails)
  - [Coffee and Tea](#coffee-and-tea)
  - [Brewing](#brewing)"
end="🍇🍈🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🥝🍅🥑🍆🥔🥕🌽🌶🥒🍄🥜🌰🍞🥐🥖🥞🧀🍖🍗🥓🍔🍟🍕🌭🌮🌯🍳🍲🥗🍿🍱🍘🍙🍚🍛🍜🍝🍠🍢🍣🍤🍥🍡🍦🍧🍨🍩🍪🎂🍰🍫🍬🍭🍮🍯🍼🥛☕🍵🍶🍾🍷🍸🍹🍺🍻🥂🥃🍽🍴🥄

Inspired by https://github.com/shaniber/recipes
"

getMarkdownLinks() {
  for file in $(find . -iname "*.md" -not -name "README.md" -not -iname "*template*" | sort); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/# //g')]("$file")"
  done
}

getDrinkLinks() {
  echo "$(getMarkdownLinks)" | grep drink | sort
}

getFoodLinks() {
  echo "$(getMarkdownLinks)" | grep food | sort
}

filter() {
  echo "$1" | grep -E "$2"
}

drinkLinks="$(getDrinkLinks)"
foodLinks="$(getFoodLinks)"

echo "$start

## Food

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

## Drinks

### Cocktails
$(filter "$drinkLinks" cocktails)

### Coffee and Tea
$(filter "$drinkLinks" coffee\|tea)

### Brewing
$(filter "$drinkLinks" beers)

$end"
