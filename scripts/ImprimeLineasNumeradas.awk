{
if ($1 > max)
	max = $1
	arr[$1] = $0
} END {
for (x = 1; x <= max; x++)
#	if (x in arr)
		print arr[x]
}

