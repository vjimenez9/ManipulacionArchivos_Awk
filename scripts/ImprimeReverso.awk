{
if ($1 > max)
	max = $1
	arr[$1] = $0
} END {
for (x = max; x > 0; x--)
	if (x in arr)
		print arr[x]
}

