#!/bin/sh

start="# Recipes

It's recipes. You know, to cook with.

<https://github.com/chadlavi/recipes>

## Categories

[Breads](#breads) &middot; [Breakfasts](#breakfasts) &middot; [Desserts](#desserts) &middot; [Main courses](#main-courses) &middot; [Pasta](#pasta) &middot; [Pizza](#pizza) &middot; [Salads](#salads) &middot; [Sandwiches](#sandwiches) &middot; [Sides and dips](#sides-and-dips) &middot; [Snacks](#snacks) &middot; [Soup](#soup) &middot; [Cured and pickled](#cured-and-pickled) &middot; [Condiments, sauces and toppings](#condiments-sauces-and-toppings) &middot; [Cocktails](#cocktails) &middot; [Coffee and tea](#coffee-and-tea) &middot; [Brewing](#brewing) &middot; [Holiday](#holiday) &middot; [Pressure cooker](#pressure-cooker)

## Contents"

end="🍇🍈🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🥝🍅🥑🍆🥔🥕🌽🌶🥒🍄🥜🌰🍞🥐🥖🥞🧀🍖🍗🥓🍔🍟🍕🌭🌮🌯🍳🍲🥗🍿🍱🍘🍙🍚🍛🍜🍝🍠🍢🍣🍤🍥🍡🍦🍧🍨🍩🍪🎂🍰🍫🍬🍭🍮🍯🍼🥛☕🍵🍶🍾🍷🍸🍹🍺🍻🥂🥃🍽🍴🥄

_Inspired by <https://github.com/shaniber/recipes>_"

getMarkdownLinks() {
  for file in $(find . -iname "*.md" -not -name "README.md" -not -iname "*template*"); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/^# //')]("$file")"
  done
}

getHolidayLinks() {
  for file in $(find . -name '*.md' -not -name "README.md" -type f -exec grep -F -li 'holiday' {} +); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/^# //')]("$file")"
  done
}

getPressureCookerLinks() {
  for file in $(find . -name '*.md' -not -name "README.md" -type f -exec grep -FE -li 'pressure cooker|instant pot' {} +); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/^# //')]("$file")"
  done
}

filter() {
  echo "$1" | grep -E "$2"
}

markdownLinks="$(getMarkdownLinks)"
holidayLinks="$(getHolidayLinks | sort)"
pressureCookerLinks="$(getPressureCookerLinks | sort)"
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

### Holiday

$holidayLinks

### Pressure cooker

$pressureCookerLinks

$end"
