- name: Copy source code to server
  uses: appleboy/scp-action@master
  with:
    host: ${{ secrets.SERVER_IP }}
    username: ${{ secrets.SERVER_USER }}
    key: ${{ secrets.SSH_PRIVATE_KEY }}
    port: 2244
    source: "."
    target: "/opt/apps/springboot-app"
