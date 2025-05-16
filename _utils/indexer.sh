#!/bin/sh

start="# Recipes

It's recipes. You know, to cook with.

<https://github.com/chadlavi/recipes>

## Categories

[Breads](#breads) &middot; [Breakfasts](#breakfasts) &middot; [Desserts](#desserts) &middot; [Main courses](#main-courses) &middot; [Pasta](#pasta) &middot; [Pizza](#pizza) &middot; [Salads](#salads) &middot; [Sandwiches](#sandwiches) &middot; [Sides and dips](#sides-and-dips) &middot; [Snacks](#snacks) &middot; [Soup](#soup) &middot; [Cured and pickled](#cured-and-pickled) &middot; [Condiments, sauces and toppings](#condiments-sauces-and-toppings) &middot; [Cocktails](#cocktails) &middot; [Coffee and tea](#coffee-and-tea) &middot; [Brewing](#brewing) &middot; [Holiday](#holiday) &middot; [Pressure cooker](#pressure-cooker) &middot; [Japanese](#japanese)

[Rice cooker reference](./food/rice/zojirushi-reference.md)

## Contents"

end="🍇🍈🍉🍊🍋🍌🍍🍎🍏🍐🍑🍒🍓🥝🍅🥑🍆🥔🥕🌽🌶🥒🍄🥜🌰🍞🥐🥖🥞🧀🍖🍗🥓🍔🍟🍕🌭🌮🌯🍳🍲🥗🍿🍱🍘🍙🍚🍛🍜🍝🍠🍢🍣🍤🍥🍡🍦🍧🍨🍩🍪🎂🍰🍫🍬🍭🍮🍯🍼🥛☕🍵🍶🍾🍷🍸🍹🍺🍻🥂🥃🍽🍴🥄

_Inspired by <https://github.com/shaniber/recipes>_"

# When a link looks like "* [The Someting Something](...)", sort it as though the word "The" weren't there
sortLinksWithoutLeadingThe() {
  cat | sed -e 's/\[The \(.*\)]/[\1, The]/gi' | sort | sed -e 's/\[\(.*\), The\]/[The \1]/gi'
}

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
  for file in $(find . -name '*.md' -not -name "README.md" -type f -exec grep -li 'pressure cooker\|instant pot' {} +); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/^# //')]("$file")"
  done
}

getJapaneseLinks() {
  for file in $(find . -name '*.md' -not -name "README.md" -type f -exec grep -li 'japanese' {} +); do
    echo "* [$(cat "$file" | head -n 1 | sed 's/^# //')]("$file")"
  done
}

filter() {
  echo "$1" | grep -E "$2"
}

markdownLinks="$(getMarkdownLinks)"
holidayLinks="$(getHolidayLinks)"
pressureCookerLinks="$(getPressureCookerLinks | sortLinksWithoutLeadingThe)"
japaneseLinks="$(getJapaneseLinks | sortLinksWithoutLeadingThe)"
drinkLinks="$(filter "$markdownLinks" drink | sortLinksWithoutLeadingThe)"
foodLinks="$(filter "$markdownLinks" food | sortLinksWithoutLeadingThe)"

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

### Japanese

$japaneseLinks

$end"
