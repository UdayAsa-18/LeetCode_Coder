class Solution:
    def twoSum(self, nums: List[int], target: int) -> List[int]:
        result = {}

        for i in range(len(nums)):
            t = target-nums[i]

            if t in result:
                return (result[t],i)
            else:
                result[nums[i]] = i